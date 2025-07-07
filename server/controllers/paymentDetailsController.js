import models from '../models/index.js'

export const getPaymentList = async (req, res) => {
  try {
    const payments = await models.PaymentDetails.findAll({
      include: [
        {
          model: models.User,
          as: 'user'
        }
      ]
    });
    res.json(payments);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

export const getPaymentById = async (req, res) => {
  try {
    const payment = await models.PaymentDetails.findOne({
      where: { id: req.params.id },
      include: [
        {
          model: models.User,
          as: 'user'
        }
      ]
    });
    if (!payment) return res.status(404).json({ error: 'Payment not found' });
    res.json(payment);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

export const createPayment = async (req, res) => {
  try {
    const payment = await models.PaymentDetails.create(req.body);
    res.status(201).json(payment);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

export const updatePayment = async (req, res) => {
  try {
    const [updated] = await models.PaymentDetails.update(req.body, {
      where: { id: req.params.id }
    });
    if (!updated) return res.status(404).json({ error: 'Payment not found' });
    res.json({ message: 'Payment updated successfully' });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

export const deletePayment = async (req, res) => {
  try {
    const deleted = await models.PaymentDetails.destroy({
      where: { id: req.params.id }
    });
    if (!deleted) return res.status(404).json({ error: 'Payment not found' });
    res.status(204).send();
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

export const getUserPaymentDetails = async (req, res) => {
  try {
    const payments = await models.PaymentDetails.findAll({
      where: { user_id: req.params.userId },
      include: [
        {
          model: models.User,
          as: 'user'
        }
      ]
    });
    if (!payments.length) return res.status(404).json({ error: 'No payment details found for this user' });
    res.json(payments);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
}