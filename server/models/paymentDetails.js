export default (sequelize, DataTypes) => {
  return sequelize.define('PaymentDetails', {
    payment_id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    user_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    username: {
      type: DataTypes.STRING(100),
      allowNull: false
    },
    card_number: {
      type: DataTypes.STRING(20),
      allowNull: false
    },
    card_type: {
      type: DataTypes.STRING(50),
      allowNull: false
    },
    cvv_number: {
      type: DataTypes.STRING(3),
      allowNull: false
    },
    expiry_date: {
      type: DataTypes.DATE
    }
  },
  {
    tableName: 't_payment_details',
    timestamps: false
  });
};