
const express =require('express');

const usuario = require('../model/usuario');

const bcrypt =require('bcryptjs');

const jwt = require('jsonwebtoken');

const authConfig = require('../config/auth');

const routerUsuario = express.Router();

function generateToken(params={}){

    return jwt.sign(params,authConfig.secret,{
expiresIn:86400,

    });
}

routerUsuario.post('/',async(req,res)=>{
const {email} = req.body;

try{

    if(await usuario.findOne({email})){

        return res.status(400).send({error: 'usuario ja existe'});
    }
const user =  await usuario.create(req.body);
user.password=undefined;

return res.send({user,token: generateToken({id: user.id}),
});

}catch(err){
return res.status(400).send({error:'registration failed'});
}
});




module.exports= app => app.use('/cadastro',routerUsuario);