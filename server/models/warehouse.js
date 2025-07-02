export default (sequelize, DataTypes) => {
  const Warehouse = sequelize.define('Warehouse', {
    warehouse_id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    name: {
      type: DataTypes.STRING(50),
      allowNull: false
    },
    address: {
      type: DataTypes.STRING(100),
      allowNull: false
    },
    city: {
      type: DataTypes.STRING(100),
      allowNull: false
    },
    state: {
      type: DataTypes.STRING(100),
      allowNull: false
    },
    zip_code: {
      type: DataTypes.STRING(10),
      allowNull: false
    },
    country: {
      type: DataTypes.STRING(100),
      allowNull: false
    }
  },
  {
    tableName: 't_warehouse',
    timestamps: false
  });

  return Warehouse;
};