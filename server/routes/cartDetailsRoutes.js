import express from 'express';
import { createCartDetails, deleteCartDetail, updateCartDetail, getCartDetailById, getCartDetails, getCartDetailsByCartId } from '../controllers/cartDetailsController.js';

const router = express.Router();

router.post('/', createCartDetails);
router.get('/', getCartDetails);
router.get('/:cartId/:productId', getCartDetailById);
router.put('/:cartId/:productId', updateCartDetail);
router.delete('/:cartId/:productId', deleteCartDetail);
router.get('/:cartId', getCartDetailsByCartId);

export default router;