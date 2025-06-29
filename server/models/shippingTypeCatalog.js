export default (sequelize, DataTypes) => {
  return sequelize.define('ShippingType', {
    shipping_id: {
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
    }
  },
  {
    tableName: 't_shipping_type_catalog',
    timestamps: false
  });
};