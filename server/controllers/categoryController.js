import models from '../models/index.js'

export const getAllCategories = async (req, res) => {
  try {
    const categories = await models.Category.findAll();
    res.json(categories);
  } catch (error) {
    res.status(500).json({ error: 'Error al obtener categorías' });
  }
};

export const getCategoryById = async (req, res) => {
  try {
    const category = await models.Category.findByPk(req.params.id);
    if (!category) return res.status(404).json({ error: 'Categoría no encontrada' });
    res.json(category);
  } catch (error) {
    res.status(500).json({ error: 'Error al obtener categoría' });
  }
};

export const createCategory = async (req, res) => {
  try {
    const newCategory = await models.Category.create(req.body);
    res.status(201).json(newCategory);
  } catch (error) {
    res.status(500).json({ error: 'Error al crear categoría' });
  }
};

export const updateCategory = async (req, res) => {
  try {
    const updated = await models.Category.update(req.body, { where: { category_id: req.params.id } });
    res.json({ updated });
  } catch (error) {
    res.status(500).json({ error: 'Error al actualizar categoría' });
  }
};

export const deleteCategory = async (req, res) => {
  try {
    await models.Category.destroy({ where: { category_id: req.params.id } });
    res.status(204).send();
  } catch (error) {
    res.status(500).json({ error: 'Error al eliminar categoría' });
  }
};