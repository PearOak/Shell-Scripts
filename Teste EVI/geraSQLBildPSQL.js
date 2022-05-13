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
    const bodyRequisicao = `{"startDateIntervalBegin":"2021-01-01T09:14:11", "startDateIntervalEnd":"2500-01-01T09:14:11", "flowId": ${fluxo},"simulation": false, "pageNumber": ${pagina}, "recordsPerPage": 100, "useCache": false, "formFieldNames":["nomeDoTerreno","dataDaSolicitao", "regional", "novaRegional", "cidadeDoEstudo", "cotaGoogle", "comarCotaMzxima", "zona", "taxaDeOcupaoMzxima", "coeficienteDeAproveitamento", "ticketcomite", "responszvelProduto", "responszvelStudio", "tipoDeSolicitao", "croqui", "googlekmz", "resediretriz"]}`;
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
                let insertAtual = `INSERT INTO terrenos_evi.bild (ticket, fluxo, nomeDoTerreno,dataDaSolicitao, regional, novaRegional, cidadeDoEstudo, cotaGoogle, comarCotaMzxima, zona, taxaDeOcupaoMzxima, coeficienteDeAproveitamento, ticketcomite, responszvelProduto, responszvelStudio, croqui, googlekmz, resediretriz, tipoDeSolicitao) VALUES(`;
                ticketAtual = dados[i]["formFields"];
                tam = ticketAtual.length;

                if (tam === 17 && ticketAtual[0]["value"].search(/teste/i) === -1) {
                    stringFinal = `${stringFinal}${insertAtual}${dados[i].id}, `;
                    stringFinal = `${stringFinal}${dados[i].flow.id}, `;
                    for (let j = 0; j < tam; j++) {
                        stringFinal = `${stringFinal}'${ticketAtual[j]["value"].replace(/\'/g, "''")}', `;
                    }
                    stringFinal = stringFinal.substring(stringFinal.lastIndexOf(", "), 0);
                    stringFinal = `${stringFinal});\n`;
                }
                else {
			//console.log(ticketAtual[0]["value"]);
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
    let fluxos = [693, 916];
    const tam = fluxos.length;
    let pagina = "";
    let fluxo = "";
    let stringFinal = `CREATE SCHEMA IF NOT EXISTS terrenos_evi;\nCREATE TABLE IF NOT EXISTS terrenos_evi.bild (\nticket INT PRIMARY KEY,\nfluxo INT NOT NULL,\nnomeDoTerreno VARCHAR(255) NOT NULL,\ndataDaSolicitao VARCHAR(30),\nregional VARCHAR(30) NOT NULL,\nnovaRegional VARCHAR(255),\ncidadeDoEstudo VARCHAR(255) NOT NULL,\ncotaGoogle VARCHAR(255),\ncomarCotaMzxima VARCHAR(255),\nzona VARCHAR(255) NOT NULL,\ntaxaDeOcupaoMzxima VARCHAR(30) NOT NULL,\ncoeficienteDeAproveitamento VARCHAR(30) NOT NULL,\nticketcomite VARCHAR(255),\nresponszvelProduto VARCHAR(255) NOT NULL,\nresponszvelStudio VARCHAR(255) NOT NULL,\ncroqui VARCHAR(255),\ngooglekmz VARCHAR(255),\nresediretriz VARCHAR(255),\ntipoDeSolicitao VARCHAR(255)\n);\n`;
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
