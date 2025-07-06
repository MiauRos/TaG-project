import express from 'express';
import { getAllOrders, createOrder, deleteOrder, updateOrder, getOrdersByUserId, getOrderById } from '../controllers/orderController.js'

const router = express.Router();

router.get('/', getAllOrders);
router.get('/user/:userId', getOrdersByUserId);
router.get('/:id', getOrderById);
router.post('/', createOrder);
router.put('/:id', updateOrder);
router.delete('/:id', deleteOrder);

export default router;