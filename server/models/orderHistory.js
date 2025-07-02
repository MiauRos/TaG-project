export default (sequelize, DataTypes) => {
  const OrderHistory = sequelize.define('OrderHistory', {
    history_id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    order_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    creation_date: {
      type: DataTypes.DATE
    },
    created_by: {
      type: DataTypes.STRING(15),
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
    tableName: 't_order_history',
    timestamps: false
  });

  OrderHistory.associate = (models) => {
    OrderHistory.belongsTo(models.Order, {
      foreignKey: 'order_id',
      as: 'order'
    });
  };

  return OrderHistory;
};