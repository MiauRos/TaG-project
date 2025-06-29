import { Sequelize, DataTypes } from 'sequelize';

import UserModel from './user.js';
import ProductModel from './product.js';
import CategoryModel from './categoryCatalog.js';
import CartModel from './cart.js';
import CartDetailsModel from './cartDetails.js';
import OrderModel from './order.js';
import OrderHistoryModel from './orderHistory.js';
import OrderStatusModel from './orderStatusCatalog.js';
import PaymentDetailsModel from './paymentDetails.js';
import ShippingTypeModel from './shippingTypeCatalog.js';
import WarehouseModel from './warehouse.js';

// Conexión a la base de datos
const sequelize = new Sequelize('tag_db', 'root', '', {
  host: 'localhost',
  dialect: 'mysql',
  logging: false, // Desactiva logs SQL (opcional)
});

// Inicializar modelos
const models = {
  User: UserModel(sequelize, DataTypes),
  Product: ProductModel(sequelize, DataTypes),
  Category: CategoryModel(sequelize, DataTypes),
  Cart: CartModel(sequelize, DataTypes),
  CartDetails: CartDetailsModel(sequelize, DataTypes),
  Order: OrderModel(sequelize, DataTypes),
  OrderHistory: OrderHistoryModel(sequelize, DataTypes),
  OrderStatus: OrderStatusModel(sequelize, DataTypes),
  PaymentDetails: PaymentDetailsModel(sequelize, DataTypes),
  ShippingType: ShippingTypeModel(sequelize, DataTypes),
  Warehouse: WarehouseModel(sequelize, DataTypes),
};

// Asociaciones definidas dentro de los modelos
Object.values(models).forEach((model) => {
  if (typeof model.associate === 'function') {
    model.associate(models);
  }
});

// Exporta el objeto de modelos y la conexión
export { sequelize };
export default models;
