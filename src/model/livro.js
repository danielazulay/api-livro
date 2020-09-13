
const mongoose = require('../database');

const livroSchema = new mongoose.Schema({

    titulo:{
    type: String,
     require:true,
    },
    editora:{
    type: String,
     require:true,
    },
    user:{
    type:mongoose.Schema.Types.ObjectId,
    ref:'user',
    require:true,

    },
    

        createdAt:{
        type:Date,
        defalt:Date.now,
    },

});


const livro = mongoose.model('livro',livroSchema);

module.exports=livro;