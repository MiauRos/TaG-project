export default (sequelize, DataTypes) => {
  return sequelize.define('Product', {
    name: DataTypes.STRING,
    description: DataTypes.TEXT,
    price: DataTypes.FLOAT,
    imageUrl: DataTypes.STRING,
  });
};
