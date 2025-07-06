import express from 'express';
import { getWarehouseById, createWarehouse, updateWarehouse, deleteWarehouse, getAllWarehouses } from '../controllers/warehouseController.js';

const router = express.Router();

router.get('/', getAllWarehouses);
router.get('/:id', getWarehouseById);
router.post('/', createWarehouse);
router.put('/:id', updateWarehouse);
router.delete('/:id', deleteWarehouse);

export default router;