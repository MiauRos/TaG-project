import express from 'express';
import { getStatusById, createStatus, updateStatus, deleteStatus, getOrderStatus } from '../controllers/orderStatusCatalogController.js';

const router = express.Router();

router.get('/', getOrderStatus);
router.get('/:id', getStatusById);
router.post('/', createStatus);
router.put('/:id', updateStatus);
router.delete('/:id', deleteStatus);

export default router;