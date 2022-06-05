from Bio import SeqIO
from Bio.SeqRecord import SeqRecord


def neisseria_extraction(record):
    if "Neisseria gonorrhoeae" in record.description:
        return SeqRecord(seq = record.seq,
                         name = record.name, id = record.id,
                         description = record.description)


extracted = (neisseria_extraction(record) for record in SeqIO.parse("./VFDB_setB_pro.fas", "fasta") if neisseria_extraction(record) is not None)
SeqIO.write(extracted, "./Neisseria_vfs.fasta", "fasta")

