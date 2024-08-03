enum SectionRenderingType {
  LISTING,
  SEQUENTIAL,
  MATRIX;

  static SectionRenderingType? valueOf(String? str) =>
      SectionRenderingType.values.firstWhere(
          (SectionRenderingType e) => e.toString() == 'SectionRenderingType.' '$str',
          orElse: () => SEQUENTIAL);
}
