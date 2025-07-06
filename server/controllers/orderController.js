import models from '../models/index.js';

export const getAllOrders = async (req, res) => {
  try {
    const orders = await models.Order.findAll({
      include: [
        {
          model: models.User,
          as: 'user'
        },
        {
          model: models.OrderStatus,
          as: 'status'
        },
        {
          model: models.ShippingType,
          as: 'shipping'
        },
        {
          model: models.PaymentDetails,
          as: 'payment',
        },
        {
          model: models.Cart,
          as: 'cart'
        },
        {
          model: models.Warehouse,
          as: 'warehouse'
        }
      ]
    });
    res.json(orders);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

export const getOrderById = async (req, res) => {
  try {
    const order = await models.Order.findByPk(req.params.id, {
      include: [
        {
          model: models.User,
          as: 'user'
        },
        {
          model: models.OrderStatus,
          as: 'status'
        },
        {
          model: models.ShippingType,
          as: 'shipping'
        },
        {
          model: models.PaymentDetails,
          as: 'payment',
        },
        {
          model: models.Cart,
          as: 'cart'
        },
        {
          model: models.Warehouse,
          as: 'warehouse'
        }
      ]
    });
    if (!order) return res.status(404).json({ error: 'Orden no encontrado' });
    res.json(order);
  } catch (error) {
    res.status(500).json({ error: 'Error al obtener Orden' });
  }
};

export const createOrder = async (req, res) => {
  try {
    const newOrder = await models.Order.create(req.body);
    res.status(201).json(newOrder);
  } catch (error) {
    res.status(500).json({ error: 'Error al crear orden' });
  }
};

export const updateOrder = async (req, res) => {
  try {
    const updated = await models.Order.update(req.body, { where: { order_id: req.params.id } });
    res.json({ updated });
  } catch (error) {
    res.status(500).json({ error: 'Error al actualizar orden' });
  }
};

export const deleteOrder = async (req, res) => {
  try {
    await models.Order.destroy({ where: { order_id: req.params.id } });
    res.status(204).send();
  } catch (error) {
    res.status(500).json({ error: 'Error al eliminar producto' });
  }
};

export const getOrdersByUserId = async (req, res) => {
  try {
    const orders = await models.Order.findAll({
      where: { user_id: req.params.userId },
      include: [
        {
          model: models.User,
          as: 'user'
        },
        {
          model: models.OrderStatus,
          as: 'status'
        },
        {
          model: models.ShippingType,
          as: 'shipping'
        },
        {
          model: models.PaymentDetails,
          as: 'payment',
        },
        {
          model: models.Cart,
          as: 'cart'
        },
        {
          model: models.Warehouse,
          as: 'warehouse'
        }
      ]
    });
    res.json(orders);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};