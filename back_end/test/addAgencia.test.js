const chai = require('chai')
const expect = chai.expect
const chaiHttp = require('chai-http')

chai.use(chaiHttp)

it('Check response Post /api/v1/novoAgencia', function () {
    chai.request('http://localhost:3000')
        .post('/api/v1/novoAgencia')
        .send({nome: "teste",banco:'1', fone: '11111111111'})
        .end((err, res) => {
            expect(res).to.have.status(200)
            console.log("add agencia passed")
            return
        });


})
