
const mongoose = require('../database');
const bcrypt = require('bcryptjs');
const UsuarioSchema = new mongoose.Schema({

    name:{
        type: String,
        require:true,
    },
    
    email:{
        type:String,
        unique:true,
        require:true,
  
        lowercase:true,
    },

    password: {
type:String,
required:true,
select:false,

    },
    createdAt:{
        type:Date,
        defalt:Date.now,
    },


});

UsuarioSchema.pre('save', async function(next){
const hash = await bcrypt.hash(this.password,10);
this.password = hash;

next();

});


const usuario = mongoose.model('usuario',UsuarioSchema);

module.exports=usuario;