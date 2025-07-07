import express from 'express';
import { createCart, getAllCarts, getCartById, updateCart, deleteCart, getCartByUserId } from '../controllers/cartController.js'

const router = express.Router();

router.post('/', createCart);
router.put('/:id', updateCart);
router.get('/', getAllCarts);
router.get('/:id', getCartById);
router.delete('/:id', deleteCart);
router.get('/user/:userId', getCartByUserId);

export default router;