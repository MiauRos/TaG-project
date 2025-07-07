import models from '../models/index.js'

export const getAllCarts = async (req, res) => {
  try {
    const carts = await models.Cart.findAll({
      include: [{
        model: models.User,
        as: 'user'
      }]
    });
    res.json(carts);
  } catch (error) {
    res.status(500).json({ error: 'Error al obtener carritos' });
  }
}

export const getCartById = async (req, res) => {
  try {
    const cart = await models.Cart.findByPk(req.params.id, {
      include: [{
        model: models.User,
        as: 'user'
      }]
    });
    if (!cart) return res.status(404).json({ error: 'Carrito no encontrado' });
    res.json(cart);
  } catch (error) {
    res.status(500).json({ error: 'Error al obtener carrito' });
  }
};

export const createCart = async (req, res) => {
  try {
    const newCart = await models.Cart.create(req.body);
    res.status(201).json(newCart);
  } catch (error) {
    res.status(500).json({ error: 'Error al crear carrito' });
  }
};

export const updateCart = async (req, res) => {
  try {
    const updated = await models.Cart.update(req.body, { where: { cart_id: req.params.id } });
    res.json({ updated });
  } catch (error) {
    res.status(500).json({ error: 'Error al actualizar carrito' });
  }
};

export const deleteCart = async (req, res) => {
  try {
    await models.Cart.destroy({ where: { cart_id: req.params.id } });
    res.status(204).send();
  } catch (error) {
    res.status(500).json({ error: 'Error al eliminar carrito' });
  }
};

export const getCartByUserId = async (req, res) => {
  try {
    const { is_staging, is_active } = req.query;

    const whereClause = {
      user_id: req.params.userId,
      ...(is_staging !== undefined && { is_staging: is_staging === 'true' }),
      ...(is_active !== undefined && { is_active: is_active === 'true' })
    };

    const carts = await models.Cart.findAll({ where: whereClause },
      {
        include: [{
          model: models.User,
          as: 'user'
        }]
      }
    );
    res.json(carts);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
}