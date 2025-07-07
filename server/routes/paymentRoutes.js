import express from 'express';
import { getPaymentList, createPayment, deletePayment, updatePayment, getPaymentById, getUserPaymentDetails } from '../controllers/paymentDetailsController.js';

const router = express.Router();

router.get('/', getPaymentList);
router.get('/:id', getPaymentById);
router.post('/', createPayment);
router.put('/:id', updatePayment);
router.delete('/:id', deletePayment);
router.get('/user/:userId', getUserPaymentDetails);

export default router;