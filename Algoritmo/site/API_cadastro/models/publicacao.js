'use strict';

/* 
lista e explicação dos Datatypes:
https://codewithhugo.com/sequelize-data-types-a-practical-guide/
*/

module.exports = (sequelize, DataTypes) => {
    let Publicacao = sequelize.define('Publicacao',{	
		id: {
			field: 'idSuporte',
			type: DataTypes.INTEGER,
			primaryKey: true,
			autoIncrement: true
		},	
        assunto: {
            field: 'assunto',
            type: DataTypes.STRING,
            allowNull: false
        },

		data: {
            field: 'dataEnvio',
            type: DataTypes.STRING,
            allowNull: false
        },

        fkUsuario: {
            field: 'fkUsuario',
            type: DataTypes.INTEGER,
            allowNull: false
        }
	}, 
	{
		tableName: 'suporte', 
		freezeTableName: true, 
		underscored: true,
		timestamps: false,
	});

    return Publicacao;
};
