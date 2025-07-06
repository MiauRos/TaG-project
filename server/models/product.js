export default (sequelize, DataTypes) => {
  const Product = sequelize.define('Product', {
    product_id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    category_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    name: {
      type: DataTypes.STRING(100),
      allowNull: false
    },
    description: {
      type: DataTypes.STRING(100),
      allowNull: false
    },
    price: {
      type: DataTypes.FLOAT,
      allowNull: false
    },
    stock: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    is_active: {
      type: DataTypes.BOOLEAN,
      allowNull: false
    },
    weight: {
      type: DataTypes.FLOAT,
      allowNull: false
    },
    dimensions: {
      type: DataTypes.FLOAT,
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
    },
    image_url: {
      type: DataTypes.STRING(255)
    }
  },
  {
    tableName: 't_product',
    timestamps: false
  });

  Product.associate = (models) => {
    Product.belongsTo(models.Category, {
      foreignKey: 'category_id',
      as: 'category'
    });
  };

  return Product;
};
