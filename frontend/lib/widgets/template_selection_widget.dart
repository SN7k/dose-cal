import 'package:flutter/material.dart';
import '../services/case_template_service.dart';

class TemplateSelectionWidget extends StatefulWidget {
  final Function(String) onTemplateSelected;
  final String? selectedTemplateId;

  const TemplateSelectionWidget({
    super.key,
    required this.onTemplateSelected,
    this.selectedTemplateId,
  });

  @override
  State<TemplateSelectionWidget> createState() => _TemplateSelectionWidgetState();
}

class _TemplateSelectionWidgetState extends State<TemplateSelectionWidget> {
  String _searchQuery = '';
  CaseTemplateType? _selectedType;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: const BoxDecoration(
        color: Color(0xFF0B1220),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Color(0xFF161B29),
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              children: [
                // Handle bar
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.white30,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 16),
                
                // Title
                const Row(
                  children: [
                    Icon(Icons.description, color: Color(0xFF5B6BE1), size: 24),
                    SizedBox(width: 12),
                    Text(
                      'Select Template',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                
                // Search bar
                TextField(
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Search templates...',
                    prefixIcon: const Icon(Icons.search, color: Colors.white54),
                    suffixIcon: _searchQuery.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear, color: Colors.white54),
                            onPressed: () {
                              setState(() {
                                _searchQuery = '';
                              });
                            },
                          )
                        : null,
                    filled: true,
                    fillColor: const Color(0xFF0B1220),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          
          // Filter chips
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildFilterChip('All', null),
                const SizedBox(width: 8),
                ...CaseTemplateType.values.map((type) => Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: _buildFilterChip(_formatTypeName(type), type),
                )),
              ],
            ),
          ),
          
          // Templates list
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: _getFilteredTemplates().map((template) => 
                _buildTemplateCard(template)
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, CaseTemplateType? type) {
    final isSelected = _selectedType == type;
    
    return FilterChip(
      label: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.white60,
          fontSize: 12,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          _selectedType = selected ? type : null;
        });
      },
      backgroundColor: const Color(0xFF161B29),
      selectedColor: const Color(0xFF5B6BE1),
      checkmarkColor: Colors.white,
      side: BorderSide(
        color: isSelected ? const Color(0xFF5B6BE1) : const Color(0xFF2A3441),
      ),
    );
  }

  Widget _buildTemplateCard(CaseTemplate template) {
    final isSelected = widget.selectedTemplateId == template.id;
    
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF161B29),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected ? const Color(0xFF5B6BE1) : const Color(0xFF2A3441),
          width: isSelected ? 2 : 1,
        ),
      ),
      child: InkWell(
        onTap: () {
          widget.onTemplateSelected(template.id);
          Navigator.of(context).pop();
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header row
              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: template.color.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      template.icon,
                      color: template.color,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          template.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          template.description,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white60,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (isSelected)
                    const Icon(
                      Icons.check_circle,
                      color: Color(0xFF5B6BE1),
                      size: 24,
                    ),
                ],
              ),
              
              const SizedBox(height: 12),
              
              // Template type badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: template.color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  _formatTypeName(template.type),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: template.color,
                  ),
                ),
              ),
              
              const SizedBox(height: 8),
              
              // Sections preview
              Text(
                'Sections: ${template.sections.map((s) => s.title).join(', ')}',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white38,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              
              // Required sections indicator
              if (template.sections.any((s) => s.isRequired)) ...[
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      size: 12,
                      color: Colors.orange,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${template.sections.where((s) => s.isRequired).length} required sections',
                      style: const TextStyle(
                        fontSize: 11,
                        color: Colors.orange,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  List<CaseTemplate> _getFilteredTemplates() {
    var templates = CaseTemplateService.getAllTemplates();
    
    // Filter by type
    if (_selectedType != null) {
      templates = templates.where((t) => t.type == _selectedType).toList();
    }
    
    // Filter by search query
    if (_searchQuery.isNotEmpty) {
      templates = CaseTemplateService.searchTemplates(_searchQuery);
      if (_selectedType != null) {
        templates = templates.where((t) => t.type == _selectedType).toList();
      }
    }
    
    return templates;
  }

  String _formatTypeName(CaseTemplateType type) {
    switch (type) {
      case CaseTemplateType.admission:
        return 'Admission';
      case CaseTemplateType.progress:
        return 'Progress';
      case CaseTemplateType.discharge:
        return 'Discharge';
      case CaseTemplateType.procedure:
        return 'Procedure';
      case CaseTemplateType.consultation:
        return 'Consult';
      case CaseTemplateType.emergency:
        return 'Emergency';
      case CaseTemplateType.icu:
        return 'ICU';
      case CaseTemplateType.pediatric:
        return 'Pediatric';
      case CaseTemplateType.surgical:
        return 'Surgical';
      case CaseTemplateType.medication:
        return 'Medication';
    }
  }
}
