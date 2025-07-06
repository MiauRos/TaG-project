import express from 'express';
import { getShippingTypeById, createShippingType, deleteShippingType, updateShippingType, getShippingTypes } from '../controllers/shippingTypeController.js';

const router = express.Router();

router.get('/', getShippingTypes);
router.get('/:id', getShippingTypeById);
router.post('/', createShippingType);
router.put('/:id', updateShippingType);
router.delete('/:id', deleteShippingType);

export default router;