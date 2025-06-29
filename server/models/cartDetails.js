export default (sequelize, DataTypes) => {
  const CartDetails = sequelize.define('CartDetails', {
    cart_id: {
      type: DataTypes.INTEGER,
      primaryKey: true
    },
    product_id: {
      type: DataTypes.INTEGER,
      primaryKey: true
    },
    quantity: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    total_price: {
      type: DataTypes.FLOAT,
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
    tableName: 't_cart_details',
    timestamps: false
  });

  CartDetails.associate = (models) => {
    CartDetails.belongsTo(models.Cart, {
      foreignKey: 'cart_id',
      as: 'cart'
    });
  };

  CartDetails.associate = (models) => {
    CartDetails.belongsTo(models.User, {
      foreignKey: 'user_id',
      as: 'user'
    });
  };
};