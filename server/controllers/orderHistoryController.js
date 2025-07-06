import models from '../models/index.js'

export const getAllOrderHistories = async (req, res) => {
  try {
    const orderHistories = await models.OrderHistory.findAll({
      include: [
        {
          model: models.Order,
          as: 'order'
        }
      ]
    });
    res.json(orderHistories);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
}

export const getOrderHistoryById = async (req, res) => {
  try {
    const orderHistory = await models.OrderHistory.findByPk(req.params.id, {
      include: [
        {
          model: models.Order,
          as: 'order'
        }
      ]
    });
    if (!orderHistory) return res.status(404).json({ error: 'Historial de pedido no encontrado' });
    res.json(orderHistory);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

export const createOrderHistory = async (req, res) => {
  try {
    const newOrderHistory = await models.OrderHistory.create(req.body);
    res.status(201).json(newOrderHistory);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

export const updateOrderHistory = async (req, res) => {
  try {
    const updated = await models.OrderHistory.update(req.body, {
      where: { history_id: req.params.id }
    });
    res.json({ updated });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

export const deleteOrderHistory = async (req, res) => {
  try {
    await models.OrderHistory.destroy({ where: { history_id: req.params.id } });
    res.status(204).send();
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

export const getHistoryByOrderId = async (req, res) => {
  try {
    const orderHistories = await models.OrderHistory.findAll({
      where: { order_id: req.params.orderId },
      include: [
        {
          model: models.Order,
          as: 'order'
        }
      ]
    });
    if (!orderHistories || orderHistories.length === 0) return res.status(404).json({ error: 'No se encontraron historiales para este pedido' });
    res.json(orderHistories);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
}