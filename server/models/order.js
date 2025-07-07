export default (sequelize, DataTypes) => {
  const Order = sequelize.define('Order', {
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

  Order.associate = (models) => {
    Order.belongsTo(models.User, {
      foreignKey: 'user_id',
      as: 'user'
    });

    Order.belongsTo(models.OrderStatus, {
      foreignKey: 'status_id',
      as: 'status'
    });

    Order.belongsTo(models.ShippingType, {
      foreignKey: 'shipping_id',
      as: 'shipping'
    });

    Order.belongsTo(models.PaymentDetails, {
      foreignKey: 'payment_id',
      as: 'payment'
    });

    Order.belongsTo(models.Warehouse, {
      foreignKey: 'warehouse_id',
      as: 'warehouse'
    });

    Order.belongsTo(models.Cart, {
      foreignKey: 'cart_id',
      as: 'cart'
    });
  };

  return Order;
};