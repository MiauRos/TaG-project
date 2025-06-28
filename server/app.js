import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import { sequelize } from './config/database.js';
import ProductModel from './models/Product.js';
import productRoutes from './routes/productRoutes.js';

dotenv.config();
const app = express();

app.use(cors());
app.use(express.json());

const Product = ProductModel(sequelize, sequelize.constructor.DataTypes);
app.use((req, res, next) => {
  req.models = { Product };
  next();
});

app.use('/api/products', productRoutes);

export default app;
