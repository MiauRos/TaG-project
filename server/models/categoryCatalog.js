export default (sequelize, DataTypes) => {
  const Category = sequelize.define('Category', {
    category_id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    name: {
      type: DataTypes.STRING(50),
      allowNull: false
    },
    description: {
      type: DataTypes.STRING(100),
      allowNull: false
    },
    additional_details: {
      type: DataTypes.STRING(100),
      allowNull: false
    }
  },
  {
    tableName: 't_category_catalog',
    timestamps: false
  });

  return Category;
};