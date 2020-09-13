const express = require('express');
const authmid =require('../mid/auth'); 


const Livro = require('../model/livro');

const router =express.Router();

router.use(authmid);



router.post('/',async(req,res)=>{


    try{ 
        const book = await Livro.create({...req.body, user:req.userId});
        return res.send({book});

        }catch(err){

       
        return res.status(400).send({erro:"erro cadastrando um livro novo"});
    }

});


module.exports = app => app.use('/cria-livro',router);