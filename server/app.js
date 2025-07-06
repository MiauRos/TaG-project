import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import productRoutes from './routes/productRoutes.js';
import userRoutes from './routes/userRoutes.js';
import cartRoutes from './routes/cartRoutes.js';
import cartDetailsRoutes from './routes/cartDetailsRoutes.js';
import categoryRoutes from './routes/categoryRoutes.js'
import orderRoutes from './routes/orderRoutes.js';
import orderHistoryRoutes from './routes/orderHistoryRoutes.js';
import orderStatusRoutes from './routes/orderStatusRoutes.js';
import paymentRoutes from './routes/paymentRoutes.js';
import shippingRoutes from './routes/shippingRoutes.js';
import warehouseRoutes from './routes/warehouseRoutes.js';

dotenv.config();
const app = express();

app.use(cors());
app.use(express.json());

app.use('/api/cart', cartRoutes);
app.use('/api/cart-details', cartDetailsRoutes);
app.use('/api/category', categoryRoutes);
app.use('/api/order', orderRoutes);
app.use('/api/order-history', orderHistoryRoutes);
app.use('/api/order-status', orderStatusRoutes);
app.use('/api/payment', paymentRoutes);
app.use('/api/products', productRoutes);
app.use('/api/shipping', shippingRoutes);
app.use('/api/user', userRoutes);
app.use('/api/warehouse', warehouseRoutes);

export default app;
