package ix.core.models;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Version;

import com.fasterxml.jackson.annotation.JsonView;

@Entity
@Table(name="ix_core_procrec")
@Indexable(indexed = false)
@SequenceGenerator(name = "LONG_SEQ_ID", sequenceName = "ix_core_procrec_seq", allocationSize = 1)
public class ProcessingRecord extends LongBaseModel {
    public enum Status {
        OK, FAILED, PENDING, UNKNOWN, ADAPTED
    }

    @Column(name="rec_start")
    public Long start;
    @Column(name="rec_stop")
    public Long stop;

    @Column(length=128)
    public String name;
    
    @ManyToMany
    @JoinTable(name="ix_core_procrec_prop", inverseJoinColumns = {
            @JoinColumn(name="ix_core_value_id")
    })    
    public Set<Value> properties = new HashSet<Value>();
    
    
    @Version
    public Timestamp lastUpdate; // here
    
    
    /**
     * record status
     */
    public Status status = Status.PENDING;

    /**
     * detailed status message
     */
    @Lob
    @Basic(fetch=FetchType.EAGER)
    public String message;

    @OneToOne(cascade=CascadeType.ALL)
    public XRef xref;
    
    @ManyToOne(cascade = CascadeType.PERSIST)
    @JsonView(BeanViews.Full.class)
    public ProcessingJob job;

    public ProcessingRecord () {}
}
