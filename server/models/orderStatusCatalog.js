export default (sequelize, DataTypes) => {
  const OrderStatus = sequelize.define('OrderStatus', {
    status_id: {
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
    tableName: 't_order_status_catalog',
    timestamps: false
  });

  return OrderStatus;
};