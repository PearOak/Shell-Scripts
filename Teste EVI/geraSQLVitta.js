//const fetch = require("node-fetch");
import fetch from 'node-fetch';

function delay(tempo) {
    return new Promise(espera => setTimeout(espera, tempo));
}
async function consultaTicketEVI(fluxo, pagina) {
    await delay(1000);
    let stringFinal = "";
    let ticketAtual = "";
    let tam = "";
    const url = `https://bildvitta.orquestrabpm.com.br/api/2/instances/report`;
    const bodyRequisicao = `{"startDateIntervalBegin":"2021-01-01T09:14:11", "startDateIntervalEnd":"2500-01-01T09:14:11", "flowId": ${fluxo},"simulation": false, "pageNumber": ${pagina}, "recordsPerPage": 100, "useCache": false, "formFieldNames":["nomeDoTerreno","regional","cep","endereco","numeroendereco","complemento","bairro","cidade","uf","matrcula","kmz","zreaBruta","zoneamento","inclinaoMdia","infraestruturaUrbana","statusDoTerreno","fluxoDeCompra","cdigoFunoResponszvel"]}`;
    const headerRequisicao = {"Content-Type": "application/json", "Authorization": "Bearer uQLhVpS2kx2%2B95sRUwiq1uh8iRycp%2BWro6efT7eNTFM%3D"};
    const objReq = {
        method: 'post',
        body: bodyRequisicao,
        headers: headerRequisicao
    };
    const consulta = await fetch(url, objReq)
    .then( (resp) => {
        return resp.json();
    })
    .then( (dados) => {
        const tamRetorno = dados.length;

        if (tamRetorno === 0) {
            return "";
        }
        else {
            for (let i = 0; i < tamRetorno; i++) {
                let insertAtual = `INSERT INTO vitta (ticket, fluxo, nomeDoTerreno, regional, cep, endereco, numeroendereco, complemento, bairro, cidade, uf, matrcula, kmz, zreaBruta, zoneamento, inclinaoMdia, infraestruturaUrbana, statusDoTerreno, fluxoDeCompra, cdigoFunoResponszvel) VALUES(`;
                ticketAtual = dados[i]["formFields"];
                tam = ticketAtual.length;

                if (tam === 18 && ticketAtual[0]["value"].search(/test/i) === -1) {
                    stringFinal = `${stringFinal}${insertAtual}${dados[i].id}, `;
                    stringFinal = `${stringFinal}${dados[i].flow.id}, `;
                    for (let j = 0; j < tam; j++) {
                        stringFinal = `${stringFinal}'${ticketAtual[j]["value"].replace(/\'/g, "''")}', `;
                    }
                    stringFinal = stringFinal.substring(stringFinal.lastIndexOf(", "), 0);
                    stringFinal = `${stringFinal});\n`;
                }
                else {
                }
            }
            return stringFinal;
        }
    })
    .catch( (erro) => {
        return erro;
    });
    return consulta;
}
async function teste() {
    let fluxos = [888];
    const tam = fluxos.length;
    let pagina = "";
    let fluxo = "";
    let stringFinal = `CREATE DATABASE IF NOT EXISTS terrenos_evi CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;\nUSE terrenos_evi;\nCREATE TABLE IF NOT EXISTS vitta (\nticket INT PRIMARY KEY,\nfluxo INT NOT NULL,\nnomeDoTerreno VARCHAR(255) NOT NULL,\nregional VARCHAR(255) NOT NULL,\ncep VARCHAR(255) NOT NULL,\nendereco VARCHAR(255) NOT NULL,\nnumeroendereco VARCHAR(20) NOT NULL,\ncomplemento VARCHAR(255),\nbairro VARCHAR(255) NOT NULL,\ncidade VARCHAR(255) NOT NULL,\nuf VARCHAR(20) NOT NULL,\nmatrcula VARCHAR(255) NOT NULL,\nkmz VARCHAR(255) NOT NULL,\nzreaBruta VARCHAR(255) NOT NULL,\nzoneamento VARCHAR(255) NOT NULL,\ninclinaoMdia VARCHAR(6) NOT NULL,\ninfraestruturaUrbana VARCHAR(5) NOT NULL,\nstatusDoTerreno VARCHAR(255),\nfluxoDeCompra VARCHAR(12),\ncdigoFunoResponszvel VARCHAR(255) NOT NULL\n);\n`;
    let consultaTicket = "";

    for (let i = 0; i < tam; i++) {
        pagina = 1;
        fluxo = fluxos[i];
    consultaTicket = await consultaTicketEVI(fluxo, pagina);
    while (consultaTicket != "") {
        stringFinal = `${stringFinal}${consultaTicket}`;
        pagina++;
        consultaTicket = await consultaTicketEVI(fluxo, pagina);
    }
    }
    console.log(stringFinal);
}
teste();
