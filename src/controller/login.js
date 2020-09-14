
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

    const{email,password}=req.body;

    const user = await usuario.findOne({email}).select('+password');

    if(!user)
    return res.status(400).send({error:'usuario nao encontrado'});

    if(!await bcrypt.compare(password,user.password))
    return res.status(400).send({error:'senha nao confere'});



    user.password=undefined;




    res.send({user, token:generateToken({id:user.id})});
});





module.exports= app => app.use('/login',routerUsuario);