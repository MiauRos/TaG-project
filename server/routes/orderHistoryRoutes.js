import express from 'express';
import { getAllOrderHistories, createOrderHistory, deleteOrderHistory, updateOrderHistory, getHistoryByOrderId, getOrderHistoryById } from '../controllers/orderHistoryController.js';

const router = express.Router();

router.get('/', getAllOrderHistories);
router.get('/:id', getOrderHistoryById);
router.get('/order/:orderId', getHistoryByOrderId);
router.post('/', createOrderHistory);
router.put('/:id', updateOrderHistory);
router.delete('/:id', deleteOrderHistory);

export default router;