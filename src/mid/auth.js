
const jwt = require('jsonwebtoken');

const authconfig = require('../config/auth.json');

module.exports=(req,res,next)=>{

    const authHeader =req.headers.authorization;

    if(!authHeader)
   return res.status(401).send({error:"o token nao foi informado" });

    const parts = authHeader.split(' ');

    if(!parts.lenght===2)
    return res.status(401).send({error:"token error"});

    const[scheme,token]=parts;

    if(!/bearer$/i.test(scheme))

    return res.status(401).send({error:"token mal formatado"})

    jwt.verify(token,authconfig.secret,(err,decoded)=>{
        if(err)return res.status(401).send({error:"token invlaido"});

req.userId = decoded.id;
return next();
    });



}