# sqlalchemy

## dynamic table and column update

```python

from ... import models
# models contain table define

def update(table, cols)
	"""
	table should be the class name in your models
	cols are dict, contain column keys and values 
	update('Table', {'cols1':value1, 'cols2':value2})
	"""
	if hasattr(models, table):
		table_name = getattr(models, table)
		for (k_item, v_item) in cols.items():
			if hasattr(table_name, k_item):
				setattr(table_name, k_item, k_value)

```