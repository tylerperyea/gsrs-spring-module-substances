package ix.ginas.models.v1;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import ix.ginas.models.GinasAccessReferenceControlled;
import ix.ginas.models.GinasCommonSubData;

@Entity
@Table(name="ix_ginas_mixture")
public class Mixture extends GinasCommonSubData {
    
	@ManyToMany(cascade= CascadeType.ALL)
    @JoinTable(name="ix_ginas_substance_mix_comp", inverseJoinColumns = {
            @JoinColumn(name="ix_ginas_component_uuid")
    })
	public Set<Component> components = new HashSet<>();
	
	@OneToOne(cascade= CascadeType.ALL)
	public SubstanceReference parentSubstance;

	public SubstanceReference getParentSubstance() {
		return parentSubstance;
	}

	public void setParentSubstance(SubstanceReference parentSubstance) {
		this.parentSubstance = parentSubstance;
	}

	@JsonIgnore
	public List<Component> getMixture() {
		return new ArrayList<>(components);
	}

	public void setMixture(List<Component> mixture) {
		this.components = new HashSet<>(mixture);
	}
	
	public int size(){
		return components.size();
	}
	
	
	
/*
	public void setFromMap(Map m) {
		super.setFromMap(m);
		components = toDataHolderList(
				(List<Map>) m.get("components"),
				new DataHolderFactory<gov.nih.ncats.informatics.ginas.shared.model.v1.Component>() {
					@Override
					public gov.nih.ncats.informatics.ginas.shared.model.v1.Component make() {
						return new gov.nih.ncats.informatics.ginas.shared.model.v1.Component();
					}
				});
		parentSubstance = toDataHolder(
				m.get("parentSubstance"),
				new DataHolderFactory<gov.nih.ncats.informatics.ginas.shared.model.v1.SubstanceReference>() {
					@Override
					public gov.nih.ncats.informatics.ginas.shared.model.v1.SubstanceReference make() {
						return new gov.nih.ncats.informatics.ginas.shared.model.v1.SubstanceReference();
					}
				});
	}

	@Override
	public Map addAttributes(Map m) {
		super.addAttributes(m);

		m.put("components", toMapList(components));
		if (parentSubstance != null)
			m.put("parentSubstance", parentSubstance.toMap());
		return m;
	}*/

    @Override
	@JsonIgnore
	public List<GinasAccessReferenceControlled> getAllChildrenCapableOfHavingReferences() {
		List<GinasAccessReferenceControlled> temp = new ArrayList<GinasAccessReferenceControlled>();
		if(parentSubstance!=null){
			temp.addAll(parentSubstance.getAllChildrenAndSelfCapableOfHavingReferences());
		}
		if(components!=null){
			for(Component c: components){
				temp.addAll(c.getAllChildrenAndSelfCapableOfHavingReferences());
			}
		}
		return temp;
	}
}