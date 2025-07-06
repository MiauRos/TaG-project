import models from '../models/index.js';

export const getAllProducts = async (req, res) => {
  try {
    const products = await models.Product.findAll({
      include: {
        model: models.Category,
        as: 'category',
        attributes: ['category_id', 'name', 'description', 'additional_details']
      }
    });
    res.json(products);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

export const getProductById = async (req, res) => {
  try {
    const product = await models.Product.findByPk(req.params.id, {
      include: {
        model: models.Category,
        as: 'category',
        attributes: ['category_id', 'name', 'description', 'additional_details']
      }
    });
    if (!product) return res.status(404).json({ error: 'Producto no encontrado' });
    res.json(product);
  } catch (error) {
    res.status(500).json({ error: 'Error al obtener producto' });
  }
};

export const createProduct = async (req, res) => {
  try {
    const newProduct = await models.Product.create(req.body);
    res.status(201).json(newProduct);
  } catch (error) {
    res.status(500).json({ error: 'Error al crear producto' });
  }
};

export const updateProduct = async (req, res) => {
  try {
    const updated = await models.Product.update(req.body, { where: { product_id: req.params.id } });
    res.json({ updated });
  } catch (error) {
    res.status(500).json({ error: 'Error al actualizar producto' });
  }
};

export const deleteProduct = async (req, res) => {
  try {
    await models.Product.destroy({ where: { product_id: req.params.id } });
    res.status(204).send();
  } catch (error) {
    res.status(500).json({ error: 'Error al eliminar producto' });
  }
};
