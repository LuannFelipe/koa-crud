const chai = require('chai')
const expect = chai.expect
const chaiHttp = require('chai-http')

chai.use(chaiHttp)


it('Check status Get /api/v1/agencias', function () {
    chai.request('http://localhost:3000')
        .get('/api/v1/agencias')
        .end((error, res) =>{
            if(error){
                console.log(error)
            }else{
                expect(res).to.have.status(200)
                console.log("get agencias passed")
                return
            }

        })

})
