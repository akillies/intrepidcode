#!/usr/bin/env python3
"""
Quote Spreadsheet Analyzer
Analyzes the structure of your quotes .xls file
"""

import sys
import os

def analyze_xls(filepath):
    """Analyze Excel file structure"""
    try:
        import pandas as pd
        print(f"📊 Analyzing: {filepath}\n")

        # Read Excel file
        df = pd.read_excel(filepath)

        # Basic info
        print(f"✅ Total rows: {len(df):,}")
        print(f"✅ Columns: {len(df.columns)}\n")

        # Column names and types
        print("📋 Column Structure:")
        print("-" * 60)
        for col in df.columns:
            dtype = df[col].dtype
            non_null = df[col].notna().sum()
            null_count = df[col].isna().sum()
            print(f"  {col:30} | {dtype:10} | {non_null:,} filled | {null_count:,} empty")

        print("\n" + "=" * 60)

        # Sample data
        print("\n📝 First 5 rows:")
        print("-" * 60)
        print(df.head(5).to_string())

        print("\n" + "=" * 60)

        # Data quality checks
        print("\n🔍 Data Quality:")
        print("-" * 60)

        # Check for duplicates
        duplicates = df.duplicated().sum()
        print(f"  Duplicate rows: {duplicates:,}")

        # Check for empty rows
        empty_rows = df.isna().all(axis=1).sum()
        print(f"  Empty rows: {empty_rows:,}")

        # Statistics on text columns
        for col in df.columns:
            if df[col].dtype == 'object':
                avg_length = df[col].dropna().astype(str).str.len().mean()
                max_length = df[col].dropna().astype(str).str.len().max()
                print(f"  {col:30} | Avg: {avg_length:.0f} chars | Max: {max_length:.0f} chars")

        print("\n✨ Analysis complete!")

    except ImportError:
        print("❌ pandas not installed. Install with: pip install pandas openpyxl")
        print("\n📝 Alternative: Convert .xls to .csv in Excel and share the first few rows")
    except Exception as e:
        print(f"❌ Error analyzing file: {e}")
        print("\n💡 Tips:")
        print("  - Make sure the file exists in this directory")
        print("  - Try: ls -lh *.xls")
        print("  - Or convert to CSV first in Excel")

if __name__ == "__main__":
    print("=" * 60)
    print("  QUOTE SPREADSHEET ANALYZER")
    print("=" * 60 + "\n")

    # Look for .xls files
    xls_files = [f for f in os.listdir('.') if f.endswith('.xls') or f.endswith('.xlsx')]

    if not xls_files:
        print("❓ No .xls/.xlsx files found in current directory")
        print("\n📝 Please:")
        print("  1. Copy your quotes file here: cp /Users/adminster/dailyprov/*.xls .")
        print("  2. Run: python3 analyze_quotes.py")
        print("\n  Or specify file: python3 analyze_quotes.py your-file.xls")
    elif len(sys.argv) > 1:
        analyze_xls(sys.argv[1])
    else:
        print(f"📁 Found {len(xls_files)} spreadsheet file(s):")
        for i, f in enumerate(xls_files, 1):
            size = os.path.getsize(f) / (1024 * 1024)  # MB
            print(f"  {i}. {f} ({size:.1f} MB)")

        print(f"\n🔍 Analyzing: {xls_files[0]}")
        print("=" * 60 + "\n")
        analyze_xls(xls_files[0])
