import express from 'express';
import { loginUser, createUser, getAllUsers, updateUser, deleteUser, getUserById } from '../controllers/userController.js';

const router = express.Router();

router.post('/login', loginUser);
router.post('/', createUser);
router.get('/', getAllUsers);
router.get('/:id', getUserById);
router.put('/:id', updateUser);
router.delete('/:id', deleteUser);

export default router;