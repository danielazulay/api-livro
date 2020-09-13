const express = require('express');
const authmid =require('../mid/auth'); 


const Livro1 = require('../model/livro');

const router1 =express.Router();

router1.use(authmid);


router1.get('/',async(req,res)=>{
try{
const book1 = await Livro1.find();

return res.send({book1});

}catch(err){

return res.status(400).send({erro:"erro em listar os livros"});    
}
});


module.exports = app => app.use('/lista-de-livro',router1);