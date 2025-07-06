import express from 'express';
import { createCartDetails, deleteCartDetail, updateCartDetail, getCartDetailById, getCartDetails, getCartDetailsByCartId } from '../controllers/cartDetailsController.js';

const router = express.Router();

router.post('/', createCartDetails);
router.get('/', getCartDetails);
router.get('/:id', getCartDetailById);
router.put('/:id', updateCartDetail);
router.delete('/:id', deleteCartDetail);
router.get('/cart/:id', getCartDetailsByCartId);

export default router;