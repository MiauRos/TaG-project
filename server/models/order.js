export default (sequelize, DataTypes) => {
  return sequelize.define('Order', {
    order_id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    user_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    status_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    shipping_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    payment_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    cart_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    warehouse_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    receiver_name: {
      type: DataTypes.STRING(100),
      allowNull: false
    },
    order_total: {
      type: DataTypes.FLOAT,
      allowNull: false
    },
    creation_date: {
      type: DataTypes.DATE
    },
    created_by: {
      type: DataTypes.STRING(20),
      allowNull: false
    },
    update_date: {
      type: DataTypes.DATE
    },
    updated_by: {
      type: DataTypes.STRING(20)
    }
  },
  {
    tableName: 't_order',
    timestamps: false
  });
};