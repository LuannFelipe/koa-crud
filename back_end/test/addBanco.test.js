const chai = require('chai')
const expect = chai.expect
const chaiHttp = require('chai-http')

chai.use(chaiHttp)

it('Check response Post /api/v1/novobanco', function () {
    chai.request('http://localhost:3000')
        .post('/api/v1/novobanco')
        .send({ nome: "teste", numero: "123", ispd: "123" })
        .end((err, res) => {
            expect(res).to.have.status(200)
            expect(res.body).to.be.a('object')
            console.log("add banco passed")
            return
        });


})
