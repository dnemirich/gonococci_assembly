from Bio import SeqIO
import pandas as pd
import click


@click.command()
@click.option('--input_fa', help='Input fasta file')
@click.option('--out', help='Output tsv file')


def hits_annotation(input_fa, out):
    with open(input_fa) as handle:
        df = pd.read_csv(handle, sep="\t",header=None,names=("Query", "Database", "Pident", "Length", "Mismatch", "Gap open", "Qstart", "Qend", "Sstart", "Send", "E-value", "Bit score"))
        records = []
        for x in range(0, len(df)):
            for record in SeqIO.parse("/home/is2/internship/virulence_factors/Neisseria_vfs.fasta", "fasta"):
                if record.id == df.iloc[x,1]:
                    records.append(record.description)
        df['Product'] = records
        df.to_csv(path_or_buf=out, index=False, sep="\t")


if __name__ == '__main__':
	hits_annotation()
