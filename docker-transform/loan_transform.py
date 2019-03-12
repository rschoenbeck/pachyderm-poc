import pandas as pd
import numpy as np
from sklearn.decomposition import TruncatedSVD

# CONFIG
in_path = '/pfs/loan-input/'
filename = in_path + 'loan_data.csv'
out_file = '/pfs/out/loan_data_reduced.csv'
svd_components = 9

# Load
loan_data = pd.read_csv(filename)
selected_cols = loan_data.columns.values[2:]

# SVD transform
svd = TruncatedSVD(n_components=svd_components, random_state=7337)
reduced = pd.DataFrame(svd.fit_transform(loan_data.loc[:,selected_cols]))

# Export
df_cols = ['LOAN_ID'] + list(reduced.columns.values)
reduced['LOAN_ID'] = loan_data['LOAN_ID']
reduced = reduced[df_cols]

reduced.to_csv(out_file, index=False)


