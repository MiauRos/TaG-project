import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import { sequelize } from './config/database.js';
import ProductModel from './models/product.js';
import productRoutes from './routes/productRoutes.js';
import userRoutes from './routes/userRoutes.js';

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
app.use('/api', userRoutes);

export default app;
