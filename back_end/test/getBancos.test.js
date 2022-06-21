const chai = require('chai')
const expect = chai.expect
const chaiHttp = require('chai-http')

chai.use(chaiHttp)


it('Check status Get /api/v1/bancos', function () {
    chai.request('http://localhost:3000')
        .get('/api/v1/bancos')
        .end((error, res) =>{
            if(error){
                console.log(error)
            }else{
                expect(res).to.have.status(200)
                console.log("get bancos passed")
                return
            }

        })

})
