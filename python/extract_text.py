import fitz  # PyMuPDF

def extract_text_from_pdf(pdf_path):
    # Open the PDF file
    pdf_document = fitz.open(pdf_path)
    text = ""

    # Iterate through each page
    for page_num in range(pdf_document.page_count):
        page = pdf_document.load_page(page_num)
        text += page.get_text()

    return text

# List of PDF files
pdf_files = [
    "1.pdf",
    "2.pdf",
    "3.pdf"
]

# Extract text from each PDF file
for pdf_file in pdf_files:
    text = extract_text_from_pdf(pdf_file)
    output_file = pdf_file.replace(".pdf", ".txt")
    
    # Save the extracted text to a file
    with open(output_file, "w", encoding="utf-8") as f:
        f.write(text)

    print(f"Extracted text from {pdf_file} and saved to {output_file}")