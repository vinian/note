# sqlalchemy

## dynamic table and column update

```python

from ... import models
# models contain table define

def update(table, col_id, cols)
	"""
	table should be the class name in your models
	cols are dict, contain column keys and values 
	update('Table', {'cols1':value1, 'cols2':value2})
	"""
	if hasattr(models, table):
		table_name = getattr(models, table)
		col_info = table_name.query.filter(id=col_id).first()
		for (k_item, v_item) in cols.items():
			if hasattr(col_info, k_item):
				setattr(col_info, k_item, k_value)

```